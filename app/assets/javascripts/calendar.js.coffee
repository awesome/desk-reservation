$(document).ready ->

  calendar = $("#calendar")
  calendar.fullCalendar
    header: (left: 'title', center: '', right: 'today prev, next, agendaWeek, agendaDay')

    events: 
      url: 'https://www.google.com/calendar/feeds/vn2531po2t4m957jnhdevsubbs%40group.calendar.google.com/public/basic'

    height: 600
    defaultView: 'agendaWeek'
    weekends: false
    weekNumbers: true
    allDaySlot: false
    
    titleFormat: (week: 'MMMM yyyy', day: 'dddd, d MMM, yyyy')
    weekNumberTitle: 'Week'
    buttonText: (today: 'view today', week: 'view week', day: 'view day')

    slotMinutes: 30
    minTime: 8
    timeFormat: 'H(:mm)'
    axisFormat: 'HH:mm'
    columnFormat: (week: 'dddd d/M', day: 'dddd d MMM')