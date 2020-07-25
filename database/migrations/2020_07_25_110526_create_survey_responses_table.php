<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSurveyResponsesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('survey_responses', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable(false);
            $table->unsignedBigInteger('survey_id')->nullable(false);
            $table->tinyInteger('status',false,true)->default(0);
            $table->timestamps();
          $table->foreign('user_id')->on('users')->references('id')->onDelete('CASCADE')->onUpdate('no action');
          $table->foreign('survey_id')->on('surveys')->references('id')->onDelete('CASCADE')->onUpdate('no action');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('survey_responses');
    }
}
