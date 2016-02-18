
extension String {
    func stringByStrippingHTML() -> String {
        let string = self.stringByReplacingOccurrencesOfString("<[^>]*>", withString: "", options: .RegularExpressionSearch, range: nil)
        return string.stringByReplacingOccurrencesOfString("(\\r|\\n){3,}", withString: "\n\n", options: .RegularExpressionSearch, range: nil)
    }
}
