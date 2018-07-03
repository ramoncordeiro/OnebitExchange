$(document).ready ->

  $('#revert_selection').click ->
    currency_source= $('#source_currency').val()
    currency_target= $('#target_currency').val()
    $('#source_currency').val(currency_target)
    $('#target_currency').val(currency_source)
    $('form').submit()

  $('#amount').bind 'keyup', ->
    $('form').submit()
    return




  $('form').submit ->
    event.preventDefault();
    if $('form').attr('action') == '/convert'
      $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: $("#source_currency").val(),
                  target_currency: $("#target_currency").val(),
                  amount: $("#amount").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        
        return false;