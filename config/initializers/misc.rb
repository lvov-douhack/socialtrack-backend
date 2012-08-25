Hirb.enable if defined?(Hirb)

def ri value
  Raise DebugException, value.inspect
end
