require_relative '../karel.rb'

describe Karel do
  describe '#initialize' do
    it 'accepts coordinates and direction' do
      expect{ Karel.new }.to raise_error ArgumentError
    end
  end

  describe '#current_location' do
    let(:rover) { Karel.new(4, 1,'N') }

    it 'returns current coordinates and direction' do
      expect(rover.current_location).to eq '(4,1) N'
    end
  end

  describe '#move' do
    it 'does not change direction' do
      rover = Karel.new(4, 1, 'N')
      expect(rover.current_location).to include 'N'
      rover.move
      expect(rover.current_location).to include 'N'
    end

    context 'facing North' do
      let(:rover) { Karel.new(4, 1,'N') }

      it 'decreases the Y position' do
        expect(rover.current_location).to eq '(4,1) N'
        rover.move
        expect(rover.current_location).to eq '(4,0) N'
      end
    end

    context 'facing South' do
      let(:rover) { Karel.new(4, 1,'S') }

      it 'increases the Y position' do
        expect(rover.current_location).to eq '(4,1) S'
        rover.move
        expect(rover.current_location).to eq '(4,2) S'
      end
    end

    context 'facing West' do
      let(:rover) { Karel.new(4, 1,'W') }

      it 'decreases the X position' do
        expect(rover.current_location).to eq '(4,1) W'
        rover.move
        expect(rover.current_location).to eq '(3,1) W'
      end
    end

    context 'facing East' do
      let(:rover) { Karel.new(4, 1,'E') }

      it 'increases the X position with' do
        expect(rover.current_location).to eq '(4,1) E'
        rover.move
        expect(rover.current_location).to eq '(5,1) E'
      end
    end
  end

  describe '#left' do
    context 'given North' do
      let(:rover) { Karel.new(4, 1,'N') }

      it 'turns West' do
        expect(rover.current_location).to include 'N'
        rover.left
        expect(rover.current_location).to include 'W'
      end
    end

    context 'given South' do
      let(:rover) { Karel.new(4, 1,'S') }

      it 'turns East' do
        expect(rover.current_location).to include 'S'
        rover.left
        expect(rover.current_location).to include 'E'
      end
    end
  end

  describe '#right' do
    context 'given North' do
      let(:rover) { Karel.new(4, 1,'N') }

      it 'turns East' do
        expect(rover.current_location).to include 'N'
        rover.right
        expect(rover.current_location).to include 'E'
      end
    end

    context 'given East' do
      let(:rover) { Karel.new(4, 1,'E') }

      it 'turns South' do
        expect(rover.current_location).to include 'E'
        rover.right
        expect(rover.current_location).to include 'S'
      end
    end
  end

  describe '#follow' do
    let(:rover) { Karel.new(4, 1,'E') }
    let(:command) { 'MMMLMMRMMML' }

    it 'follows the sequence of commands and makes appropriate moves' do
      expect(rover.current_location).to eq '(4,1) E'
      rover.follow(command)
      expect(rover.current_location).to eq '(7,1) N'
    end
  end
end
