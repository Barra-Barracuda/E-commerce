$(document).ready(function() {
	cat();
	brand();
	product();

	function cat() {
		$.ajax({
				url: 'action.php',
				type: 'POST',
				data: {
					category: 1
				}
			})
			.done(function(data) {
				//console.log(data);
				$("#get_category").html(data);

			});


	}

	function brand() {
		$.ajax({
				url: 'action.php',
				type: 'POST',
				data: {
					brand: 1
				}
			})
			.done(function(data) {
				//console.log(data);

				$("#get_brand").html(data);

			});


	}


	function product() {
		$.ajax({
				url: 'action.php',
				type: 'POST',
				data: {
					getProduct: 1
				}
			})
			.done(function(data) {
				//console.log(data);
				$("#get_product").html(data);

			});
	}

	// //使用 delegate() 方法的事件处理程序适用于当前或未来的元素（比如由脚本创建的新元素）,用on要写第二个参数（被监听的元素）
	// $("body").delegate(".category", "click", function() {
	// 	alert(123);
	// })
	$('body').on('click', '.category', function(ev) {
		ev.preventDefault();
		var cid = $(this).attr('cid');
		$.ajax({
				url: 'action.php',
				type: 'POST',
				data: {
					//发送到后端
					get_selected_Category: 1,
					cat_id: cid
				}
			})
			.done(function(data) {
				//console.log("success");
				$("#get_product").html(data);
			})
	})

	$('body').on('click', '.selectBrand', function(ev) {
		ev.preventDefault();
		var bid = $(this).attr('bid');
		$.ajax({
				url: 'action.php',
				type: 'POST',
				data: {
					//发送到后端
					selectBrand: 1,
					brand_id: bid
				}
			})
			.done(function(data) {
				//console.log("success");
				$("#get_product").html(data);
			})
	})

	$('#search_btn').click(function() {
		var keyword = $('#search').val();
		if (keyword != "") {
			$.ajax({
					url: 'action.php',
					type: 'POST',
					data: {
						search: 1,
						keyword: keyword
					}
				})
				.done(function(data) {
					//console.log("success");
					$("#get_product").html(data);
				})
		}
	})
})