$(document).ready(function () {
    $(".new_project_wizard").click(function() {
        QUARTUS.new_project_wizard();
        return false;
	});

    $(".open_project").click(function() {
        QUARTUS.open_project();
        return false;
	});

    $(".open_literature").click(function() {
        QUARTUS.open_link("https://www.altera.com/products/design-software/fpga-design/quartus-ii/support.html");
        return false;
    });
    $(".open_training").click(function() {
        QUARTUS.open_link("https://www.altera.com/support/training/overview.html");
        return false;
    });
    $(".open_support").click(function() {
        QUARTUS.open_link("http://www.altera.com/support/software/sof-quartus.html?xy=gettingstartedsup");
        return false;
    });
    $(".open_whats_new").click(function() {
        QUARTUS.open_link("http://www.altera.com/products/software/quartus-ii/whats-new/swf-qts-whats-new.html");
        return false;
    });
    $(".open_web_vs_subscription").click(function() {
        QUARTUS.open_link("http://www.altera.com/literature/po/ss_quartussevswe.pdf");
        return false;
    });
    $(".open_buy_software").click(function() {
        QUARTUS.open_link("http://www.altera.com/buy/software/buy-software.html");
        return false;
    });
    $(".open_notification_center").click(function() {
        QUARTUS.open_link("https://cloud.altera.com/notify/");
        return false;
    });

    // ---------------------------------------------------
    // Check the registry value of "Don't show this screen again
    var dont_show = QUARTUS.get_dont_show_screen_registry_value();
    $("#dont_show_again").prop('checked', dont_show);
    var close = QUARTUS.get_close_page_registry_value();
    $("#close_after_load").prop('checked', close);
    
    // Set registry value if Dont Show Again check box value is changed
    $("#dont_show_again").change(function() {
        QUARTUS.set_dont_show_screen_registry_value($(this).is(':checked'));
    });

    $("#close_after_load").change(function() {
        QUARTUS.set_close_page_registry_value($(this).is(':checked'));
    });

    // ---------------------------------------------------
    // Setup recent project list
    var mru_projects = ["a.qpf", "b.qpf", "c.qpf"];
    if (typeof QUARTUS != "undefined") {
        mru_projects = QUARTUS.get_mru_projects();
    }
    var i = 0;
    var MAX_RECENT_PROJECT = 4;
    for (i = 0; i < mru_projects.length && i < MAX_RECENT_PROJECT; i++) {
        var full_path = mru_projects[i];
        var project_name = mru_projects[i].replace(/^.*[\\\/]/, '')
        var p = $("#mru-projects").append("<li class='action recent-project' id='mrup" + i.toString() + "' title='" + full_path + 
        "'><span class='project-name'>" + project_name + "</span> (" + full_path + ")</li>");
        $("#mrup" + i.toString()).click(full_path, function(event) {
            if (typeof QUARTUS != "undefined") {
                QUARTUS.open_project(event.data);
            } else {
                alert(event.data);
                console.log(event.data);
            }
        });
    }
    
    // ---------------------------------------------------------
    // Hide if it's not web edition
    var is_web_edition = QUARTUS.get_is_web_edition_value();
    if (!is_web_edition) {      
      $(".open_web_vs_subscription").hide();
      $(".open_buy_software").hide();
    }
     
});
