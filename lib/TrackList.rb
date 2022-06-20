class TrackList
  def initialize
    @tracks = []
  end

  def add(track)
    fail "Track already added." if @tracks.include?(track)
    @tracks << track
  end
  
  def list
    return "No tracks added to list." if @tracks.length == 0
    return @tracks
  end

end