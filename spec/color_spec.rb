# frozen_string_literal: true
require 'spec_helper'

describe Kodachroma::Color do
  let(:red)       { Kodachroma.paint 'red' }
  let(:other_red) { Kodachroma.paint '#f00' }
  let(:blue)      { Kodachroma.paint 'blue' }

  context 'with equality' do
    it 'equals itself' do
      expect(red).to eql(red)
      expect(red).to eq(red)
    end

    it 'equals another instance of the same color' do
      expect(red).to eql(other_red)
      expect(red).to eq(other_red)
    end

    it 'does not equal another instance of a different color' do
      expect(red).not_to eql(blue)
      expect(red).not_to eq(blue)
    end
  end

  describe '#paint' do
    it 'returns itself' do
      expect(red.paint).to equal(red)
    end
  end
end
