pub mod calculator {
    pub fn add(a: i32, b: i32) -> i32 {
        a + b
    }

    pub fn sub(a: i32, b: i32) -> i32 {
        a - b
    }
}

#[cfg(test)]
mod reproduce_issue;

#[cfg(test)]
mod tests {
    use super::calculator::*;

    #[test]
    fn add_correctly_adds_2_integers() {
        assert_eq!(add(2, 2), 4);
    }

    #[test]
    fn sub_correctly_subtracts_2_integers() {
        assert_eq!(sub(6, 2), 4);
    }
}

/* Lorem ipsum dolor sit amet, prima delicata imperdiet pro ut, id audire principes sea. Dicit repudiare nec te, ea quo quidam nostro democritum, pri cu minim causae consulatu. Has aperiri petentium ad. Nihil placerat accommodare cum ne, cu sit ludus mediocritatem. Error detracto antiopam ei vel.

Quod perpetua vix ne. Duo regione suavitate ne, vix ne graece delectus dissentiunt, id utinam option salutatus sit. Clita omnes vis ne, eu usu quis oblique. Voluptua percipitur in est, sonet pericula id qui. Salutatus voluptatum et nam, no quo veritus appetere, debet facilisis cu sed.

Ex liber accusam nec, pri iusto facilisis id. Ea brute quodsi mei, ea agam disputando nam. Quo labitur volumus eloquentiam at. Pro no alii graeci, ad sit feugait adipisci repudiandae, virtute nominavi fabellas vis eu.

Ut ignota populo aliquid qui, ad postea ancillae deseruisse vis, vel quis eius an. Diceret referrentur conclusionemque te sea, mea et idque abhorreant. An nam quas tollit copiosae, nam ei exerci doctus detraxit, dicam epicurei temporibus ea nec. Putent iisque consectetuer his ea, sea ea nonumy convenire, ex pro luptatum tractatos qualisque. Nec erant imperdiet id. Eu vero fuisset fastidii quo, ceteros alienum philosophia vix an. Et debet prodesset his.

Rebum pertinax indoctum vel te, sit eu eirmod explicari mediocritatem. Ne has deterruisset conclusionemque. Ad ius periculis reformidans, per velit docendi cu. Cu alia elitr eloquentiam vis, ut graece instructior nec, sit feugiat intellegam voluptatibus te. */
