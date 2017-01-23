<?php
class kmeans{
	// $c pada fungsi hitung merupakan centroid awal
	//sedangkan $data merupakan data yang akan diproses, dalam bentuk array 3 dimensi
	// dengan ketentuan format array(array('jumlah' => <isi [integer atau float]>))
	public function hitung($data = array()){
		if(!empty($data)){
			// var_dump($data);
			$data_value = array();
			foreach($data as $idx => $val){
				$data_value[] = $val->jumlah;
			}
			//penetapan nilai awal centroid
			$data_sum = array_sum($data_value);
			$data_count = count($data_value);			
			$c_rendah = min($data_value);
			$c_tinggi = max($data_value);
			$c_sedang = ($c_tinggi - $c_rendah) / 2;
			var_dump($c_rendah, $c_sedang, $c_tinggi, $data_sum, $data_count);
			
			//iterasi untuk menghitung centroid dan jarak data terhadap centroid
			while(true){
				
				foreach($data as $idx => $val){
					$jarak[] = $this->hitungJarakKeCentroid($val, $c_rendah, $c_sedang, $c_tinggi);
					
				}
				var_dump($jarak);
				break;
			}
			
			
		}else{
			var_dump('data kosong');
		}
		
	}
	
	private function hitungJarakKeCentroid($data, $c1, $c2, $c3){
		$jarak_c1 = sqrt(($data->jumlah - $c1) * ($data->jumlah - $c1));
		$jarak_c2 = sqrt(($data->jumlah - $c2) * ($data->jumlah - $c2));
		$jarak_c3 = sqrt(($data->jumlah - $c3) * ($data->jumlah - $c3));
		
		//1 = rendah, 2 = sedang, 3 = tinggi
		//hanya sebagai penanda
		// var_dump($jarak_c1, $jarak_c2, $jarak_c3);
		return array($jarak_c1, $jarak_c2, $jarak_c3);
		
		
		
		
	}
	
	
}



?>