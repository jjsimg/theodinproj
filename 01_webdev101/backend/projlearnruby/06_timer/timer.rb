class Timer
  #write your code here
  attr_accessor :seconds

  def initialize
    @seconds=0
    end
    def time_string
      @hours=(@seconds/(60*60))%60
      @minutes=(@seconds/60)%60
      @seconds=@seconds%60
      time="%02d:%02d:%02d" % [@hours, @minutes, @seconds]
  end
end