use std::os::raw::{c_int, c_long};
use std::env;

#[link(name = "plus")]
extern {
    // fn plus(x: c_int, y: c_int) -> c_int;
    fn plusone(x: c_int) -> c_int;
    fn current_timestamp() -> c_long;
}

fn run(count: i32){
    unsafe {
        let start = current_timestamp();
        let mut x = 0;
        while x < count {
            x = plusone(x);
        }
        let end = current_timestamp() - start;

        println!("result={}, time={}", x, end);
    }
}

fn main()
{
    let args: Vec<String> = env::args().collect();
    if args.len() == 1 {
        println!("First arg (0 - 2000000000) is required.");
        return;
    }
    let count = args[1].parse::<i32>().unwrap();
    if count <= 0 || count > 2000000000 {
        println!("Must be a positive number not exceeding 2 billion.");
        return;
    }
    run(count);
}
