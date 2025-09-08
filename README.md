# isocline zig

[isocline](https://github.com/daanx/isocline), packaged for the Zig build system.

As of the time of this writing, works in zig master (`0.16.0-dev.197+1a5cf072a`). If this stop working please open an issue.

## Using

First, update your `build.zig.zon`:

```
zig fetch --save https://github.com/allyourcodebase/isocline.git
```

Next, add this snippet to your `build.zig` script:

```zig
const isocline_dep = b.dependency("isocline", .{
    .target = target,
    .optimize = optimize,
});
your_compilation.linkLibrary(isocline_dep.artifact("isocline"));
```
