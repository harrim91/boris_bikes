require "bike"

describe Bike do
  it { expect(subject).to respond_to :working?, :report_broken }

  it "should be working when initilized" do
    expect(subject).to be_working
  end

  it "#report_broken should return false if reported broken" do
    expect(subject.report_broken).to eq false
  end
  it "#working? should return false if reported broken" do
    subject.report_broken
    expect(subject).not_to be_working
  end
end
