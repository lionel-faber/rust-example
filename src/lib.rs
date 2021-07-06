use tokio::time::{sleep, Duration};


pub async fn long_task(i: usize) {
    println!("Start - {}", i);
    sleep(Duration::from_secs(5)).await;
    println!("End - {}", i);
}

#[tokio::test]
async fn parallel_tasks() {
    use futures::future::join_all;

    let mut futures = vec![];
    for i in 0..5 {
        futures.push(long_task(i));
    }
    let _x = join_all(futures.into_iter()).await;
}