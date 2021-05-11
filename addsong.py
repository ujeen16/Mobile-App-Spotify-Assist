import spotipy
import datetime
import os
from spotipy.oauth2 import SpotifyOAuth

# spotipy credentials
os.environ["SPOTIPY_CLIENT_ID"] = "04a93a22a3b045d8911d540d515287c0"
os.environ["SPOTIPY_CLIENT_SECRET"] = "ad8dcb8a54bc42e48422ce6a5c6a5331"
os.environ["SPOTIPY_REDIRECT_URI"] = "http://google.com"

# scope used to get authorization
scope = "playlist-modify-public playlist-modify-private"
sp = spotipy.Spotify(auth_manager=SpotifyOAuth(scope=scope))

'''
from flask_api import status

@app.route('/your-api/')
def empty_view(self):
    content = {'your content here'}
    return content, status.HTTP_201_CREATED
'''
'''
client.get("http://www.google.com", params, new TextHttpResponseHandler() {
        @Override
        public void onSuccess(int statusCode, Header[] headers, String res) {
            // called when response HTTP status is "200 OK"
        }

        @Override
        public void onFailure(int statusCode, Header[] headers, String res, Throwable t) {
            // called when response HTTP status is "4XX" (eg. 401, 403, 404)
        }	
    }
);
'''
def main(name):
    artistURI = querySearch(name)
    # searching for all albums of specific artist
    result = sp.artist_albums(artistURI)
    # list of all albums by this artist
    albumList = list(result.values())[1]
    # most recent album of artist
    recentAlbum = albumList[0]
    # gets date of the album
    dateOfAlbum = list(recentAlbum.values())[9]
    dateOfAlbum = datetime.datetime.strptime(dateOfAlbum, '%Y-%m-%d')
    # today's date
    today = datetime.datetime.today()
    # gets difference of the dates
    difference = today - dateOfAlbum

    if difference.days < 30:
        # gets the URI of the album
        albumURI = list(recentAlbum.values())[13]
        albumURI = albumURI[14:]

        trackList = getTrackUri(albumURI)
        sp.playlist_add_items("7L0FjSTBnzKsVHiLTXrVbW", trackList)
    x = "hello world"
    return x


def querySearch(artistName):
    # query search for artist
    searchQuery = sp.search(q=artistName, type="artist")
    p = list(searchQuery.values())[0]
    uri = list(p.values())[1]
    searchResult = uri[0]
    artistURI = list(searchResult.values())[9]
    artistURI = artistURI[15:]

    return artistURI


def getTrackUri(albumURI):
    # gets all tracks from the album
    albumTracks = sp.album_tracks(albumURI)
    trackList = list(albumTracks.values())[1]
    URIList = []
    for i in trackList:
        trackURI = list(i.values())[13]
        trackURI = trackURI[14:]

        URIList.append(trackURI)
    return URIList


if __name__ == '__main__':
    main()
