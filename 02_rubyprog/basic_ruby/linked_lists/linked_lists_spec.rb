

require './linkedlists'

describe 'Linked List' do

  before do
    @linked_list = LinkedList.new(1)
  end

  describe '#append'  do
  	it 'should place a node at the end of the linked list' do
      a = @linked_list.append(2)
      expect(a.value).to eq(2)
    end
  	it 'should place a node at the end of the linked list twice' do
      a = @linked_list.append(3)
      expect(a.value).to eq(3)
    end
  end

  describe '#my_prepend' do
    it 'should place a node at the beginning of the linked list' do
      a = @linked_list.my_prepend(6)
      expect(a.value).to eq(6)
    end
  end
end