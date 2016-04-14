require 'spec_helper'

RSpec.describe Inputs do
  before do
    Inputs._input_evaluator = ->{ stupid_input }
  end

  describe '.yn' do
    context 'when answerd "y"' do
      let(:stupid_input) { "y\n" }

      it do
        expect(Inputs.yn('are you stupid ?')).to be true
      end
    end

    context 'when answerd "n"' do
      let(:stupid_input) { "n\n" }

      it do
        expect(Inputs.yn('are you stupid ?')).to be false
      end
    end

    context 'other key stroks' do
      def stupid_input
        @input_call_count ||= 0
        @input_call_count += 1
        if @input_call_count == 2
          "y\n"
        elsif @input_call_count == 1
          ''
        else
          'bla'
        end
      end

      it 'should repeat' do
        expect(Inputs)
          .to receive(:_input_evaluator)
          .exactly(2).times
          .and_call_original

        expect(Inputs.yn('are you stupid ?')).to be true
      end
    end
  end

  describe '.pick' do
    def trigger 
      Inputs.pick(['cat', 'dog'])
    end

    context 'when answerd "cat"' do
      let(:stupid_input) { "1\n" }

      it do
        expect(trigger).to eq 'cat'
      end
    end

    context 'when answerd "dog"' do
      let(:stupid_input) { "2\n" }

      it do
        expect(trigger).to eq 'dog'
      end
    end

    context 'other key stroks' do
      def stupid_input
        @input_call_count ||= 0
        @input_call_count += 1
        if @input_call_count == 3
          "1\n"
        elsif @input_call_count == 2
          'cat'
        elsif @input_call_count == 1
          ''
        else
          '6'
        end
      end

      it 'should repeat' do
        expect(Inputs)
          .to receive(:_input_evaluator)
          .exactly(3).times
          .and_call_original

        expect(trigger).to eq 'cat'
      end
    end
  end
end
