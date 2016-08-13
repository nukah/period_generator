require 'spec_helper'

describe PeriodGenerator do
  describe '#run' do
    subject { described_class.new(from, to).run }

    context 'same year' do
      let(:from) { Date.new(2016,7,5) }
      let(:to) { Date.new(2016,9,12) }

      it { expect(subject).to eq [Date.new(2016,7,5)..Date.new(2016,9,12)] }
    end

    context 'next year less than 12 months' do
      let(:from) { Date.new(2016,3,5) }
      let(:to) { Date.new(2017,3,1) }

      it { expect(subject).to eq [Date.new(2016,3,5)..Date.new(2017,3,1)] }
    end

    context 'next year more than 12 months' do
      let(:from) { Date.new(2016,5, 7) }
      let(:to) { Date.new(2017, 7, 7) }

      it { expect(subject).to eq [Date.new(2016,5,7)..Date.new(2017,5,6), Date.new(2017,5,7)..Date.new(2017,7,7)] }
    end

    context 'two years' do
      let(:from) { Date.new(2016, 3, 1) }
      let(:to) { Date.new(2018, 2, 5) }

      it { expect(subject).to eq [Date.new(2016,3,1)..Date.new(2017,2,28), Date.new(2017,3,1)..Date.new(2018,2,5)] }
    end
  end
end
