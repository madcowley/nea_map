# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('form[data-update-target]').on 'ajax:success', (evt, data) ->
    target = $(this).data('update-target')
    console.log "target: " + target
    $('#' + target).html(data)


