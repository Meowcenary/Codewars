# common use methods from rails, small and useful functions
module Helpers
  # https://apidock.com/rails/Object/blank%3F
  def blank?
    respond_to?(:empty?) ? !!empty? : !self
  end
end
