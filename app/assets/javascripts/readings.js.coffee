$ ->
  if $('#readings_chart').length > 0
    Morris.Line
      element: 'readings_chart'
      data: $('#readings_chart').data().readings,
      xkey: 'created_at'
      ykeys: ['blood_glucose']
      labels: ['blood glucose']
