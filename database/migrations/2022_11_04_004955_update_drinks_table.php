<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('drinks', function(Blueprint $table){
            $table->unsignedInteger('type_id');
            $table->foreign('type_id')->references('id')->on('type_drinks')->onDelete('cascade');
            $table->unsignedInteger('brand_id');
            $table->foreign('brand_id')->references('id')->on('brands')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('drinks', function(Blueprint $table){
            $table->dropForeign('drinks_type_id_foreign');
            $table->dropForeign('drinks_brand_id_foreign');
            $table->dropColumn('type_id');
            $table->dropColumn('brand_id');
        });
    }
};
