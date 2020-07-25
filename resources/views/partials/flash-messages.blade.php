{{--

    * Created by   :  Muhammad Yasir
    * Project Name : bluebox
    * Product Name : PhpStorm
    * Date         : 11-Jan-19 11:52 AM
    * File Name    : flash-messages.blade.php

--}}
<div class="col-sm-12">
    <div class="alerts"></div>

    @if ($message = Session::get('success'))
        <div class="alert alert-success alert-block">
            <button type="button" class="close" data-dismiss="alert">×</button>
            {{ $message }}
        </div>
    @endif


    @if ($message = Session::get('error'))
        <div class="alert alert-danger alert-block">
            <button type="button" class="close" data-dismiss="alert">×</button>
            {{ $message }}
        </div>
    @endif


    @if ($message = Session::get('warning'))
        <div class="alert alert-warning alert-block">
            <button type="button" class="close" data-dismiss="alert">×</button>
            {{ $message }}
        </div>
    @endif


    @if ($message = Session::get('info'))
        <div class="alert alert-info alert-block">
            <button type="button" class="close" data-dismiss="alert">×</button>
            {{ $message }}
        </div>
    @endif


    {{--@if ($errors->any())
        <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert">×</button>
            Please check the form below for errors
        </div>
    @endif--}}
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
</div>