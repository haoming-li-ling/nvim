;; extends

((generic_command
   . (_) @statement.inner) @command.outer)

((generic_environment) @environment.outer)

(generic_environment
  . (_) @block.start
  . (_)+ @block.inner
  . (_) @block.end . ) @block.outer

; ((generic_environment
;    . (_) @block.start
;    . (_) @_start
;    (_) @_end . (_) @block.end .
;    ) @block.outer
;  (#make-range! "block.inner" @_start @_end))
