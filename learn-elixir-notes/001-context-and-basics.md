# Why, What, and More

Notes from [Learn Elixir](https://github.com/dwyl/learn-elixir).

## Advantages of Using Elixir

- Scalability
- Speed
- Compiled and run on the Erlanv Virtual Machine, BEAM. [Well renowned for efficiency](http://stackoverflow.com/questions/16779162/what-kind-of-virtual-machine-is-beam-the-erlang-vm).
- Better _garbage collectio_ than any other VM.
- Many tiny processes > thread
- Real time apps are "easy" to build compared to other programming languages. WebSockets and Streaming by default.

**Important**

> Things will go wrong with code, and Elixir provides supervisors which describe how to restart parts of your system when things don't go as planned.

## Suggested Introductory Videos

- Pete Broderick's [Intro to Elixir](https://youtu.be/lly-1UYmnFI) (41 mins 🎥)
- Jessica Kerr's [Elixir Should Take Over the World](https://youtu.be/X25xOhntr6s) (58 mins 🎥)

## How to Install

**MacOS**

```bash
$ brew install elixir
```

**Ubuntu**

```bash
$ wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
$ sudo apt-get update
$ sudo apt-get install -y esl-erlang
$ sudo apt-get install -y elixir
```
