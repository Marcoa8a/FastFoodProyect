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
        Schema::table('foods', function(Blueprint $table){
            $table->unsignedInteger('category_id');
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
            $table->unsignedInteger('type_id');
            $table->foreign('type_id')->references('id')->on('type_foods')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('foods', function(blueprint $table){
            $table->dropForeign('foods_category_id_foreign');
            $table->dropForeign('foods_type_id_foreign');
            $table->dropColumn('category_id');
            $table->dropColumn('type_id');
        });
    }
};
