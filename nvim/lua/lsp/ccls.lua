return {
  init_options = {
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = {"-frounding-math"};
    };
    cache = {
      directory = "/tmp/ccls-cache";
    };
  }
}
