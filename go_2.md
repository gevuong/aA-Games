## Why Golang?

1. Go was invented by geniuses.
    - Ken Thompson (B, C, Unix, UTF-8)
    - Rob Pike (Unix, UTF-8)
    - Robert Griesemer (HOtspot, JVM)
    - And a few other engineers at Google

2. One of the most performant languages, except for maybe C, but C is difficult to code in.
3. Back then, all of the previous system level languages were written to run on a single core. Now, we have new machines that have multi-cores and there's no language out there (aside from Go) written to take advantage of multiple cores natively and well.
4. Because of this, Go knows how to use multi-cores natively and scales horizontally very well.
5. Doing concurrency is very easy.
6. A compiled language, all goes down to binary, there's no VM, no interpreting, it's binary. Compiles on many OS's.
7. Super fast, written to run very well in network environments.
8. Garbage collected, manages all of your memory for you in a performant way.
9. Really clean syntax, almost like a scripting language, and it's a systems level low level language with has a powerful standard library that lets you do a lot of high level things.

## Companies That Use Golang

- Google, YouTube, Apple, Dropbox, Bitbucket, Bitly, Aruba, DigitalOcean, Cloudflare, BBC Worldwide, Docker, Flipboard, Firefox, NY Times, Heroku, MongoDB, Github, Twitter, Facebook, Parse, Square, Halo, Uber, Tumblr, Halo, Nokia, Medium, Maldives, IBM, GE Software, Intel, Soundcloud.
- Huge in China.

## Farwell Node.js
- TJ Holowaychuk is one of the primary contributors to Node.js and he left Node for Golang.(https://medium.com/@tjholowaychuk/farewell-node-js-4ba9e7f3e52b). 
- Felix Geisendorfer was a signficant contributor to Node, left Node for Golang.
- Golang can be used for all these: web apps, scripts, system admin, image processing, load balancers, servers, crypto, hardware, Android & iOS. So instead of learning a bunch of other languages (ie. Swift, Javak), you just need to only know one.

## Why isn't Go perfect?
- No generics
- No algorithms in stdlib

## Concurrency and Parallelism

- Concurrency is the composition of independently executing processes, while parallelism is the simultaneous execution of (possibly related) computations.
- Concurrency is about dealing with lots of things at once. Parallelism is about doing lots of things at once. In other words, concurrency is doing many things, but only one at a time (i.e. multi-tasking or inter-leaving). So if there are 3 processes, A, B, C, running concurrently, some time will be spent on processing A, then on B, then A, then C, until all processes are complete. Parallelism is doing many things at the same time, like running those 3 processes at the same time. So if there are multiple cores, we can run each of those threads in its own core and are occurring at the exact same time.
- For example, you can teach and drink coffee concurrently (talk, and drink a little coffee) but you can't drink coffee and teach at the same time.
- You can have concurrency without parallelism, but you can't have parallelism without concurrency in parallel.
- The following initializes your program to use all cores in computer. 

```
    func init() {
        runtime.GOMAXPROCS(runtime.NumCPU())
    }
```

### Race conditions 
- To check for race conditions in your code: ```go run -race main.go``` instead of ```go run main.go```
- Mutexes (mutual exclusion) is created so that multiple program thread can take turns sharing the same resources, such as access to a file. 
- Atomicity: in `sync/atomic` package. Instead of wrapping a chunk in a mutex, you just lock one specific thing. 


## Multiple assignments 
- 
    ```
    var b, c string = "stored in b", "stored in c"
    j, k, l, m := 44.7, true, false, 'm'
    o := `o` 
    n := "n"
    ```