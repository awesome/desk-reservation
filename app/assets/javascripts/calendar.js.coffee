$(document).ready ->
  $('#calendar').fullCalendar({
    
    events: 'https://www.google.com/calendar/feeds/vn2531po2t4m957jnhdevsubbs%40group.calendar.google.com/public/basic'
    
    height: 600
    defaultView: 'agendaWeek'
    weekends: false
    weekNumbers: true
    header: (left: 'title', center: '', right: 'today prev, next, agendaWeek, agendaDay')
    titleFormat: (week: 'MMMM yyyy', day: 'dddd, d MMM, yyyy')
    weekNumberTitle: 'Week'
    buttonText: (today: 'view today', week: 'view week', day: 'view day')

    slotMinutes: 30
    minTime: 8
    timeFormat: 'H(:mm)'
    axisFormat: 'HH:mm'
    columnFormat: (week: 'dddd d/M', day: 'dddd d MMM')

    selectable: true
    selectHelper: true

    select: (startDate, endDate, allDay) ->
      
      name = prompt("Please enter your name:", "Your name")
      if (name)
        "renderEvent"
        name: name
        start: startDate
        end: endDate
        allDay: allDay
        true
      'unselect'

    

  })