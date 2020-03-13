require 'bookmark'
require 'database_helpers'

describe 'Bookmark' do
  describe '.all' do
    it 'shows a list of bookmarks' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')
      #
      # # Add the test data
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmark = Bookmark.create(title: 'Makers Academy', url:'http://www.makersacademy.com')
      Bookmark.create(title: 'Destroy Software', url: 'http://www.destroyallsoftware.com')
      Bookmark.create(title: 'Google', url: 'http://www.google.com')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(title: 'Test Book Mark', url: 'https://testbookmark.com')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Book Mark'
      expect(bookmark.url).to eq 'https://testbookmark.com'
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end
end
