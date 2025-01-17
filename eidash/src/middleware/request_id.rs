use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::Arc;

use axum::http::HeaderName;
use http::Request;
use tower_http::request_id::{MakeRequestId, RequestId, SetRequestIdLayer};

// A `MakeRequestId` that increments an atomic counter
#[derive(Clone, Default)]
pub struct MyRequestId {
    counter: Arc<AtomicU64>,
}

impl MakeRequestId for MyRequestId {
    fn make_request_id<B>(&mut self, _request: &Request<B>) -> Option<RequestId> {
        let request_id = self
            .counter
            .fetch_add(1, Ordering::SeqCst)
            .to_string()
            .parse()
            .unwrap();

        Some(RequestId::new(request_id))
    }
}

pub fn layer() -> SetRequestIdLayer<MyRequestId> {
    let x_request_id = HeaderName::from_static("x-request-id");
    SetRequestIdLayer::new(x_request_id, MyRequestId::default())
}
