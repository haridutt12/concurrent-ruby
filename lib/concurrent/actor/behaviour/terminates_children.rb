module Concurrent
  module Actor
    module Behaviour
      # Terminates all children when the actor terminates.
      class TerminatesChildren < Abstract
        def on_event(public, event)
          # TODO set event in Termination after all children are terminated, requires new non-blocking join on Future
          children.map { |ch| ch << :terminate! } if event == :terminated
          super public, event
        end
      end
    end
  end
end
