<div id="sidebar" class="sidebar responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

				<ul class="nav nav-list">
					<li class="active">
                        <a href="<?php echo base_url('index.php/home')?>">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> Home </span>
						</a>

						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-list"></i>
							<span class="menu-text"> Penjualan </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="<?php echo base_url('index.php/penjualan/view')?>">
									<i class="menu-icon fa fa-caret-right"></i>
									Data Order
								</a>

								<b class="arrow"></b>
							</li>							
						</ul>
						<ul class="submenu">
							<li class="">
								<a href="<?php echo base_url('index.php/penjualan/statistik')?>">
									<i class="menu-icon fa fa-caret-right"></i>
									Data Penjualan
								</a>

								<b class="arrow"></b>
							</li>							
						</ul>
					</li>			
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-list"></i>
							<span class="menu-text"> Produk </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="<?php echo base_url('index.php/products/view')?>">
									<i class="menu-icon fa fa-caret-right"></i>
									Daftar Produk
								</a>

								<b class="arrow"></b>
							</li>							
						</ul>
					</li>					
				</ul><!-- /.nav-list -->

				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>
