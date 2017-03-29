node default {
  $_classes = lookup('classes', {merge=>'unique'})
  include $_classes
}
