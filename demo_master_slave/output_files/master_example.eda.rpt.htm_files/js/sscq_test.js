function click_link(name)
{
   $("#" + name).click();
}

function get_check_state(name)
{
   // Get the check box state and pass it back to C++ to be pipe to Tcl channel
   var value = $("#" + name).is(':checked');
   QUARTUS.output_to_tcl(name + ": " + value);
}

function set_check_state(name, value)
{
   // Set the check state
   $("#" + name).prop('checked', value);
}

function get_recent_projects()
{
   // Return the recent project list
   var value = $('div.mru_projects-container').text();
   QUARTUS.output_to_tcl(value);
}

