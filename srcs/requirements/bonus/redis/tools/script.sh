#!/bin/sh

exec redis-server --maxmemory 256mb --maxmemory-policy allkeys-lru --protected-mode no