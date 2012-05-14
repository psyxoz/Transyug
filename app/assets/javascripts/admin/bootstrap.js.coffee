jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $("a[rel=popover]").popover offset: 10
  $(".dropdown-toggle").dropdown()
  $(".alert-message").alert()
  $(".collapse").collapse()
