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
        Schema::table('drink_orders', function (Blueprint $table){
            $table->unsignedInteger('drink_id');
            $table->foreign('drink_id')->references('id')->on('drinks')->onDelete('cascade');
            $table->unsignedInteger('order_id');
            $table->foreign('order_id')->references('id')->on('orders')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('drink_orders', function (Blueprint $table){
            $table->dropForeign('drink_orders_drink_id_foreign');
            $table->dropForeign('drink_orders_order_id_foreign');
            $table->dropColumn('drink_id');
            $table->dropColumn('order_id');
        });
    }
};
