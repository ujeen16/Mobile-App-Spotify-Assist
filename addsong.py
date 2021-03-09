import spotipy
import os
from spotipy.oauth2 import SpotifyOAuth

os.environ["SPOTIPY_CLIENT_ID"] = "04a93a22a3b045d8911d540d515287c0"
os.environ["SPOTIPY_CLIENT_SECRET"] = "ad8dcb8a54bc42e48422ce6a5c6a5331"
os.environ["SPOTIPY_REDIRECT_URI"] = "http://google.com"
scope = "playlist-modify-public playlist-modify-private"

sp = spotipy.Spotify(auth_manager=SpotifyOAuth(scope=scope))


def main():
    song=["7MAibcTli4IisCtbHKrGMh"]
    sp.playlist_add_items("7L0FjSTBnzKsVHiLTXrVbW", song)


if __name__ == '__main__':
    main()
