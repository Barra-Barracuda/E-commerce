<?php
include "db.php";
if(isset($_POST["category"])){

	//SQL SELECT * 实例 ,从 "categories" 表中选取所有的列。

	$category_query = "SELECT * FROM categories";

	//mysql_query() 函数执行一条 MySQL 查询。mysql_query(query,connection) query必需。规定要发送的 SQL 查询。connection可选。规定 SQL 连接标识符。

	$run_query = mysqli_query($con,$category_query); 
	echo "
	<div class='nav nav-pills nav-stacked'>
		<li class='active'><a href='#'><h4>Categories</h4></a></li>
		";

//mysqli_num_rows() 函数返回结果集中行的数量。

		if(mysqli_num_rows($run_query)>0){

		//mysqli_fetch_array() 函数从结果集中取得一行作为关联数组，或数字数组，或二者兼有。
			
			while($row = mysqli_fetch_array($run_query)){
				$cid = $row["cat_id"];
				$cat_name = $row["cat_title"];
			//$cid值赋值给自定义属性cid 定义class为category，然后ajax控制 
				echo "
				<li><a href='#' class='category' cid='$cid'>$cat_name</a></li>
				";
			}
			echo "</div>";
		}
	}


	if(isset($_POST["brand"])){
		$brand_query = "SELECT * FROM brands";
		$run_query = mysqli_query($con,$brand_query);
		echo "
		<div class='nav nav-pills nav-stacked'>
			<li class='active'><a href='#'><h4>Brands</h4></a></li>
			";

			if(mysqli_num_rows($run_query)>0){
				while($row = mysqli_fetch_array($run_query)){
					$bid = $row["brand_id"];
					$brand_name = $row["brand_title"];
					echo "
					<li><a href='#' class='selectBrand' bid='$bid'>$brand_name</a></li>
					";
				}
				echo "</div>";
			}
		}

		if(isset($_POST["getProduct"])){
			$product_query =  "SELECT * FROM products ORDER BY RAND() LIMIT 0,9";
			$run_query = mysqli_query($con,$product_query);
			if(mysqli_num_rows($run_query) >0 ){
				while($row = mysqli_fetch_array($run_query)){
					$pro_id = $row['product_id'];
					$pro_cat = $row['product_cat'];
					$pro_brand = $row['product_brand'];
					$pro_title = $row['product_title'];
					$pro_price = $row['product_price'];
					$pro_image = $row['product_image'];
					echo "
					<div class='col-md-4 col-xs-4 col-lg-4 col-sm-4'>
						<div class='panel panel-info'>
							<div class='panel-heading'>$pro_title</div>
							<div class='panel-body'>
								<img src='product_image/$pro_image' />
							</div>
							<div class='panel-heading'>$.$pro_price.00
								<button pid='$pro_id' class='btn btn-danger btn-xs'>AddToCart</button>
							</div>
						</div>
					</div>
					";
				}
			}

		}

		if(isset($_POST["get_selected_Category"]) || isset($_POST["selectBrand"]) || isset($_POST["search"])){

			if(isset($_POST["get_selected_Category"])){

				$id = $_POST["cat_id"];
        //从product里选product_cat 选$cid
        //SELECT 列名称 FROM 表名称 WHERE 列 运算符 值
				$sql = "SELECT * from products WHERE product_cat ='$id'";

			}else if(isset($_POST["selectBrand"])){

				$id = $_POST["brand_id"];
				
				$sql = "SELECT * FROM products WHERE product_brand ='$id'";
			}else{
				$keyword = $_POST["keyword"];
       //从 "product_keywords" 表中选包含 "$keyword" 里的东西
				$sql = "SELECT * FROM products WHERE product_keywords LIKE '%$keyword%'";
			};

			$run_query = mysqli_query($con,$sql);
			while($row=mysqli_fetch_array($run_query)){
				$pro_id = $row['product_id'];
				$pro_cat = $row['product_cat'];
				$pro_brand = $row['product_brand'];
				$pro_title = $row['product_title'];
				$pro_price = $row['product_price'];
				$pro_image = $row['product_image'];
				echo "
				<div class='col-md-4 col-xs-4 col-lg-4 col-sm-4'>
					<div class='panel panel-info'>
						<div class='panel-heading'>$pro_title</div>
						<div class='panel-body'>
							<img src='product_image/$pro_image' />
						</div>
						<div class='panel-heading'>$.$pro_price.00
							<button pid='$pro_id' class='btn btn-danger btn-xs'>AddToCart</button>
						</div>
					</div>
				</div>
				";
			}
		}

		if(isset($_POST["userLogin"])){
	//mysql_real_escape_string() 函数转义 SQL 语句中使用的字符串中的特殊字符
			$email = mysqli_real_escape_string($con,$_POST["userEmail"]);
			$password = md5($_POST["userPassword"]);
			$sql = "SELECT * FROM user_info WHERE email = '$email' AND password = '$password'";
			$run_query = mysqli_query($con,$sql);
			$count = mysqli_num_rows($run_query);
			if($count == 1){
				$row = mysqli_fetch_array($run_query);
		//PHP session 变量用于存储有关用户会话的信息，或更改用户会话的设置。Session 变量保存的信息是单一用户的，并且可供应用程序中的所有页面使用。
				$_SESSION["uid"] = $row["user_id"];
				$_SESSION["name"] = $row["first_name"];
				echo "true";
				
			}
		}

		?>