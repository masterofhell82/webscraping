<?php 

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Auth;
/**
 * Class LoginController modify
 */
class LoginController extends Controller {
	
	
	public function __construct(){
		$this -> middleware('guest', ['only' => 'showLoginForm']);
	}

	/**
	 * [showLoginForm validate that the user is logged in]
	 * @return [type] [True]
	 */
	public function showLoginForm(){
		return view('auth.login');
	}


	/**
	 * [login Function to log in the user]
	 * @return [type] [Return to the web you want to see, otherwise return to the form.]
	 */
	public function login(){
		$credentials = $this -> validate(request(), [
			'email' => 'email|required|string',
			'password' => 'required|string'
		]);


		if(Auth::attempt($credentials)){
			return redirect() -> route('dashboard');
		}

		return back() -> withErrors(['email' => trans('auth.failed')])
			-> withInput(request(['email']));
	}

	/**
	 * [logout Close session]
	 * @return [type] [Return to login form]
	 */
	public function logout(){
		
		Auth::logout();
		
		return redirect('/');
		
	}
	
}