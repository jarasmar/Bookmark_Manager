require 'bookmark'

describe 'Bookmark' do
  describe '.all' do

    it 'shows a list of bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
    end
  end
end
