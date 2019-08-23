<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnRequestProceToUserRequests extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
		Schema::table('user_requests', function (Blueprint $table) {
			
			$table->decimal('request_amount', 8, 2)->default('0.00');
			
		});
		
    }  

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
		$table->dropColumn('user_requests');
		
    }
}
