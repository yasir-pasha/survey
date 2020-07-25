<?php
  
  use Illuminate\Support\Facades\Route;
  
  /*
  |--------------------------------------------------------------------------
  | Web Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register web routes for your application. These
  | routes are loaded by the RouteServiceProvider within a group which
  | contains the "web" middleware group. Now create something great!
  |
  */
  
  
  
  Auth::routes();
  
  Route::get('/home', 'HomeController@index')->name('home');
  
  Route::prefix('/')->middleware('auth')->group(function () {
    Route::get('/','SurveyController@index' );
    Route::prefix('surveys')->name('surveys.')->group(function () {
      Route::get('/', 'SurveyController@index')->name('surveys');
      Route::get('fill/{id}', 'SurveyController@fill')->name('fill');
      Route::get('view/{id}', 'SurveyController@view')->name('view');
      Route::post('submit', 'SurveyController@submit')->name('submit');
    });
  });
