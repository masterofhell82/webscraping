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

        //
        $crawler -> filter("[class='separador'] > [class='bloque'] ") -> each( function (Crawler $node){
            $section = $node -> children();
            $sectionCat = $section -> eq(0);
            $category = $sectionCat -> filter('a') -> first() -> text();
            
            $query = DB::table('categories') 
                ->where('name', '=', $category)
                ->get() -> count();
        

            if ($query <= 0) {                   
                
                DB::table('categories')->insert([
                    'name' => $category,
                    'comment' => 'Esta categoria pertenece '.$category 
                ]);

            }                   


            $id_cat = DB::table('categories')
                ->select('id')
                ->where('name', '=', $category)
                ->get();

            $sectionSubCat = $section -> eq(1);

            $subCategories = $sectionSubCat -> filter('a') -> each(function ($nodeSub){  
                
                return $nodeSub -> text();
                
            });

          
            foreach ($subCategories as $subcat) {
                
                $querySC = DB::table('sub_categories') 
                    ->where('name', '=', $subcat)
                    ->get() -> count();


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
