$(document).ready(function () {

  var clicks = [0, 0, 0, 0, 0, 0];
  var tr = 0;

  $(document).scroll(function() {
    if ($(this).scrollTop() > 200) {
        $("#backToTop").show("slow");
      } else {
        $("#backToTop").hide("slow");
      }
  });

  $("#backToTop").click(function () {
     $("html, body").animate({scrollTop: 0}, 1000);
  });

  $("abbr").mouseover(function() {
    $(this).next().show("slow");
    $(this).hide("2000");
  });

  $(".expan").mouseover(function() {
    $(this).prev().show("slow");
    $(this).hide("2000");
  });

  $(".bilang").mouseover(function() {
    $(".bilang .fr").hide();
    $(".bilang .it").show();
  })
  .mouseout(function() {
    $(".bilang .fr").show();
    $(".bilang .it").hide();
  });

  $("#showKword").click(function() {
    clicks[0] += 1;
    if(clicks[0] % 2 == 1) {
      $(this).addClass("btnOn");
      $(".keyword").addClass("keyOn");
    } else {
      $(this).removeClass("btnOn");
      $(".keyword").removeClass("keyOn");
    }
  });

  $("#showPers").click(function() {
    clicks[1] += 1;
    if(clicks[1] % 2 == 1) {
      $(this).addClass("btnOn");
      $(".persName").addClass("persOn");
    } else {
      $(this).removeClass("btnOn");
      $(".persName").removeClass("persOn");
    }
  });

  $("#showPlaces").click(function() {
    clicks[2] += 1;
    if(clicks[2] % 2 == 1) {
      $(this).addClass("btnOn");
      $(".placeName").addClass("placeOn");
    } else {
      $(this).removeClass("btnOn");
      $(".placeName").removeClass("placeOn");
    }
  });

  $(".keyword").on('mouseover mouseout', function() {
    $(".keyword .lineNumber").css({
      "cursor": "default",
      "text-decoration": "none"
    });
  });

  $(".persDesc, .placeDesc, .keyDesc").mouseover(function() {
    $(this).next().show("slow");
  })
  .mouseout(function() {
    $(this).next().hide("slow");
  });

  $("#showGaps").click(function() {
    clicks[3] += 1;
    if(clicks[3] % 2 == 1) {
      $(this).addClass("btnOn");
      $(".gap").show("slow");
    } else {
      $(this).removeClass("btnOn");
      $(".gap").hide("slow");
    }
  });

  $("#showAdds").click(function() {
    clicks[4] += 1;
    if(clicks[4] % 2 == 1) {
      $(this).addClass("btnOn");
      $("ins").css({
        "background-color": "lightgreen",
        "font-weight": "bold",
        "padding": "2px"
      });
    } else {
      $(this).removeClass("btnOn");
      $("ins").css({
        "background-color": "",
        "font-weight": "inherit",
        "padding": ""
      });
    }
  });

  $("#showDlted").click(function() {
    clicks[5] += 1;
    if(clicks[5] % 2 == 1) {
      $(this).addClass("btnOn");
      $("del").css({"display": "inline"});
    } else {
      $(this).removeClass("btnOn");
      $("del").hide("slow");
    }
  });

  $("#trslBtn").click(function() {
    tr += 1;
    var index = 1;
    $(".slider input[type=range]").val(index);

    if(tr % 2 == 1) {
      $(this).addClass("btnOn");
      $("#trslWrapper").show("slow");
      $(".slider input[type=range]").val(index);
      $("#tr_P1_008_pr".concat(index)).show();
      $(".pr_p".concat(index)).addClass("orAreaHlight");

      $(".slider input[type=range]").on('input', function() {
        var index = $(this).val();
        $(".trslText").hide();
        $("#tr_P1_008_pr".concat(index)).show();
        $(".textContainer > span").removeClass("orAreaHlight");
        $(".pr_p".concat(index)).addClass("orAreaHlight");
      });

    } else {
      $(this).removeClass("btnOn");
      $("#trslWrapper").hide("slow");
      $(".trslText").hide();
      $(".textContainer > span").removeClass("orAreaHlight");
    }
  });

  $(".bilang").mouseover(function() {
    $(".bilang .fr").hide();
    $(".bilang .it").show();
  })
  .mouseout(function() {
    $(".bilang .fr").show();
    $(".bilang .it").hide();
  });

  $("#vers8").change(function() {
    if(!$(this).is(':checked')) {
      $("#p8 .iRecto").show("slow");
      $("#p8 .iVerso").hide("slow");
    } else {
      $("#p8 .iVerso").show("slow");
      $("#p8 .iRecto").hide("slow");
    }
  });

  $("#vers9").change(function() {
    if(!$(this).is(':checked')) {
      $("#p9 .iRecto").show("slow");
      $("#p9 .iVerso").hide("slow");
    } else {
      $("#p9 .iVerso").show("slow");
      $("#p9 .iRecto").hide("slow");
    }
  });

  $("#CDLG .bTitle").mouseover(function() {
    $("#CDLG .bkDesc").show("slow");
  });

  $("#CDLG .closePanel").click(function() {
    $("#CDLG .bkDesc").hide("slow");
  });

  $(document).on('click', 'a[href^="#"]', function(e) {
    e.preventDefault();
    $('html, body').animate({
        scrollTop: $($.attr(this, 'href')).offset().top}, 1000);
  });

});
