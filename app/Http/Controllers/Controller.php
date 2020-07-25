<?php
  
  namespace App\Http\Controllers;
  
  use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
  use Illuminate\Foundation\Bus\DispatchesJobs;
  use Illuminate\Foundation\Validation\ValidatesRequests;
  use Illuminate\Routing\Controller as BaseController;
  use Illuminate\Support\Facades\Auth;
  
  class Controller extends BaseController
  {
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    
    public $user;
    public $user_id;
    
    public function __construct()
    {
      
      if (Auth::check()) {
        $this->user    = Auth::user();
        $this->user_id = Auth::user()->id;
      }
      
    }
  }
