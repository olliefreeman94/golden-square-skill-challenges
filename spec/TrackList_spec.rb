require "TrackList"

RSpec.describe TrackList do

  it "returns 'No tracks added to list.' when list is empty" do
    track_list = TrackList.new
    expect( track_list.list ).to eq "No tracks added to list."
  end

  it "returns correct list when one track added" do
    track_list = TrackList.new
    track_list.add("Running Up That Hill")
    expect( track_list.list ).to eq ["Running Up That Hill"]
  end

  it "returns correct list when multiple tracks added" do
    track_list = TrackList.new
    track_list.add("Running Up That Hill")
    track_list.add("Wuthering Heights")
    expect( track_list.list ).to eq ["Running Up That Hill", "Wuthering Heights"]
  end

  it "returns an error when duplicate track added" do
    track_list = TrackList.new
    track_list.add("Running Up That Hill")
    expect{ track_list.add("Running Up That Hill") }.to raise_error "Track already added."
  end

end