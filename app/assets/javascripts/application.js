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
  let tag_count = 10 - $(".tagit-choice").length    // 登録済みのタグを数える
  $(".ui-widget-content.ui-autocomplete-input").attr(
    'placeholder','あと' + tag_count + '個登録できます');
});

// タグ入力で、placeholder を変更
$(document).on("keyup", '.tagit', function() {
  let tag_count = 10 - $(".tagit-choice").length
  $(".ui-widget-content.ui-autocomplete-input").attr(
  'placeholder','あと' + tag_count + '個登録できます');
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

// アバウトのページ内推移
$('#page-link a[href*="#"]').click(function () {
  var elmHash = $(this).attr('href'); //ページ内リンクのHTMLタグhrefから、リンクされているエリアidの値を取得
  var pos = $(elmHash).offset().top;  //idの上部の距離を取得
  $('body,html').animate({scrollTop: pos}, 500);  //取得した位置にスクロール。数値が大きくなるほどゆっくりスクロール
  return false;
});

//モーダルウィンドー
$(function(){
  //オーバーレイとコンテンツの表示
  $(".modal-open").click(function(){
    $(this).blur() ; //ボタンからフォーカスを外す
    if($( ".modal-overlay")[0]) return false; //新たにオーバーレイが追加されるのを防ぐ
    $("body").append('<div class="modal-overlay"></div>'); //オーバーレイ用のHTMLをbody内に追加
    $(".modal-overlay").fadeIn("slow"); //オーバーレイの表示
    $(".modal").fadeIn("slow"); //モーダルウインドウの表示

    //モーダルウインドウの終了
    $(".modal-overlay,.modal-close").unbind().click(function(){
      $( ".modal,.modal-overlay" ).fadeOut( "slow" , function(){ //閉じるボタンかオーバーレイ部分クリックでフェードアウト
        $('.modal-overlay').remove(); //フェードアウト後、オーバーレイをHTMLから削除
      });
    });
  });
});


$('.first-content a[href*="#"]').click(function () {//全てのページ内リンクに適用させたい場合はa[href*="#"]のみでもOK
	var elmHash = $(this).attr('href'); //ページ内リンクのHTMLタグhrefから、リンクされているエリアidの値を取得
	var pos = $(elmHash).offset().top;	//idの上部の距離を取得
	$('body,html').animate({scrollTop: pos}, 500); //取得した位置にスクロール。500の数値が大きくなるほどゆっくりスクロール
	return false;
});
});