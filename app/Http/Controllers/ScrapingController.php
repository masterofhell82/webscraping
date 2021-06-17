<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

/**
 * WebScraping Headers
 */
use Goutte\Client; 
use Symfony\Component\DomCrawler\Crawler;
use Symfony\Component\DomCrawler\Link;

use Illuminate\Support\Facades\DB;

/**
 * Controller class
 */
class ScrapingController extends Controller{
    

    public function __construct(){
        $this -> middleware('auth');
    }
    
    /**
     * [scrape description]
     * @param  Client $client [description]
     * @return [type]         [description]
     */
    public function scrape(Client $client){
        
        $objScraper = [];

        // Go to the www.anundos.com  website
        $crawler = $client -> request('GET', 'https://www.anundos.com/');

        //command to apply the filter and select by sections. Using Crawler
        $crawler -> filter("[class='separador'] > [class='bloque'] ") -> each( function (Crawler $node){
            //It is divided into sections
            $section = $node -> children();
            
            //Section 1
            $sectionCat = $section -> eq(0);
            
            //The information is extracted from the first section.
            $category = $sectionCat -> filter('a') -> first() -> text();
            
            //The database is consulted to see if the record exists.
            $query = DB::table('categories') 
                ->where('name', '=', $category)
                ->get() -> count();
        
            //If the record is not present, category is added
            if ($query <= 0) {                   
                
                DB::table('categories')->insert([
                    'name' => $category,
                    'comment' => 'Esta categoria pertenece '.$category 
                ]);

            }                   

            //Then, the id related to the category is extracted.
            $id_cat = DB::table('categories')
                ->select('id')
                ->where('name', '=', $category)
                ->get();

            //Section 2
            $sectionSubCat = $section -> eq(1);

            //The information of the second part is extracted, the same is stored 
            //in a variable that is converted into an array.
            $subCategories = $sectionSubCat -> filter('a') -> each(function ($nodeSub){  
                
                return $nodeSub -> text();
                
            });

          

            foreach ($subCategories as $subcat) {
                
                 //The database is consulted to see if the record exists.
                $querySC = DB::table('sub_categories') 
                    ->where('name', '=', $subcat)
                    ->get() -> count();

                //If the record is not present, subcategory is added
                if ($querySC <= 0) {

                    DB::table('sub_categories')->insert([
                        'name' => $subcat,
                        'comment' => 'Esta subcategoria pertenece '.$category,
                        'categories_id' => $id_cat[0] -> id 
                    ]);

                }

           }
            
        });

        echo 'done';


    }
}
