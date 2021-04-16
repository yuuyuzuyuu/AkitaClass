// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require jquery-ui
//= require tag-it
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function () {
    $(".openbtn").click(function () {   //ボタンクリック
	$(this).toggleClass('active');  //ボタン自身に activeクラスを付与
    $("#g-nav").toggleClass('panelactive'); //ナビゲーションにpanelactiveクラスを付与
});
});

$(document).on('turbolinks:load', function () {
$("#g-nav a").click(function () {   //ナビゲーションのリンククリック
    $(".openbtn").removeClass('active');    //ボタンの activeクラスを除去
    $("#g-nav").removeClass('panelactive'); //ナビゲーションのpanelactiveクラスも除去
});
});

// タグ追加の際のTag it導入
$(document).on('turbolinks:load', function() {
  $(".tag_form").tagit({  // 指定のセレクタに、tag-itを反映
    tagLimit:10,    // タグの最大数
    singleField: true,   // タグの一意性
 // availableTags: ['ruby', 'rails', ..]  自動補完する一覧を設定できる(※ 配列ならok)。
  });
  // let tag_count = 10 - $(".tagit-choice").length    // 登録済みのタグを数える
  // $(".ui-widget-content.ui-autocomplete-input").attr(
  //   'placeholder','あと' + tag_count + '個登録できます');
});

// タグ入力で、placeholder を変更
$(document).on('turbolinks:load', "keyup", '.tagit', function() {
  // let tag_count = 10 - $(".tagit-choice").length
  // $(".ui-widget-content.ui-autocomplete-input").attr(
  // 'placeholder','あと' + tag_count + '個登録できます');

   // Ajaxで、タグ一覧を取得
  let input = $(".ui-widget-content.ui-autocomplete-input").val();  // 変数inputに、入力値を格納
  $.ajax({
    type: 'GET',
    url: 'get_tag_search',  // ルーティングで設定したurl
    data: { key: input },  // 入力値を:keyとして、コントローラーに渡す
    dataType: 'json'
  })

  .done(function(data){
    if(input.length) {  // 入力値がある時のみ
      let tag_list = [];  // 空の配列を準備
      data.forEach(function(tag) {   // 取得したdataのnameを配列に格納
        tag_list.push(tag.name);  // 1つずつ追加。 tag_list = ["タグ名1", "タグ名2", ..]
      });
      $(".tag_form").tagit({
        availableTags: tag_list
      });
    }
  });
});

// ページトップリンク
//スクロールした際の動きを関数でまとめる
$(document).on('turbolinks:load', function () {

function PageTopAnime() {
	var scroll = $(window).scrollTop();
	if (scroll >= 100){ //上から100pxスクロールしたら
		$('#page-top').removeClass('DownMove'); //#page-topについているDownMoveというクラス名を除く
		$('#page-top').addClass('UpMove');  //#page-topについているUpMoveというクラス名を付与
	}else{
		if($('#page-top').hasClass('UpMove')){  //すでに#page-topにUpMoveというクラス名がついていたら
			$('#page-top').removeClass('UpMove'); //UpMoveというクラス名を除き
			$('#page-top').addClass('DownMove');  //DownMoveというクラス名を#page-topに付与
		}
	}
}

//画面をスクロールをしたら動かしたい場合の記述
$(window).scroll(function () {
	PageTopAnime(); //スクロールした際の動きの関数を呼ぶ
});

// ページが読み込まれたらすぐに動かしたい場合の記述
$(window).on('load', function () {
	PageTopAnime(); //スクロールした際の動きの関数を呼ぶ
});


//#page-topをクリックした際の設定
$('#page-top').click(function () {
	var scroll = $(window).scrollTop(); //スクロール値を取得
	if(scroll > 0){
		$(this).addClass('floatAnime'); //クリックしたらfloatAnimeというクラス名が付与
        $('body,html').animate({
            scrollTop: 0
        }, 2000,function(){ //スクロールの速さ。数字が大きくなるほど遅くなる
            $('#page-top').removeClass('floatAnime'); //上までスクロールしたらfloatAnimeというクラス名を除く
        });	
	}
    return false; //リンク自体の無効化
});

// トップ画像にslick導入
$(function() {
  $('.top-image').slick({
    dots: true,
    autoplay: true,
    autoplaySpeed: 3000,
    fade: true,
  });
});
});
