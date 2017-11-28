from rest_framework import serializers


# HyperlinkedModelSerializer : Use hyperlink to represent a relationship (instead of ids)
from snippets_example.models import Snippet


class SnippetSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Snippet
        fields = ('url', 'title', 'file')
