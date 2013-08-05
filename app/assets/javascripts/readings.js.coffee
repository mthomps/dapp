# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  if $('#readings_chart').length > 0
    Morris.Line
      element: 'readings_chart'
      data: $('#readings_chart').data().readings,
      xkey: 'created_at'
      ykeys: ['blood_glucose']
      labels: ['blood glucose']
